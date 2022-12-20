const db = require('../db/index')


exports.get_contact = (req, res) => {
    db.query('SELECT * FROM tb_contact', (err, rows) => {
            if (err) return res.fail(err)
            res.send({
                status: 0,
                message: '获取联系人信息成功！',
                data: rows,
            })
        }
    )
}

exports.add_contact = (req, res) => {

    db.query('SELECT COUNT(*) as count FROM tb_contact WHERE id =?', [req.body.id], (err, rows) => {
        if (rows[0].count === 1) return res.fail('ID重复！')
        let userId = req.auth.id // 获得所属用户的ID
        let sql = 'INSERT INTO tb_contact(id, user_id, name, sex, mobile, email, qq, weixin, company, address, post_code) VALUES (?,?,?,?,?,?,?,?,?,?,?)'
        db.query(sql, [req.body.id, userId, req.body.name, req.body.sex, req.body.mobile, req.body.email, req.body.qq, req.body.weixin, req.body.company, req.body.address, req.body.post_code], (err, results) => {
            if (err) res.fail(err)
            res.send({
                status: 0,
                message: '添加联系人成功！'
            })
        })
    })


}

exports.update_contact = (req, res) => {
    let userId = req.auth.id
    let flag = false
    db.query('SELECT role FROM tb_user WHERE id=?', userId, (err, rows) => {
        if (rows[0].role === '管理员') {
            flag = true
        }
    })
    db.query('SELECT user_id FROM tb_contact WHERE id=?', req.body.id, (err, rows) => {
        if (rows[0].user_id === userId || flag) {   // 只允许管理员账户或者所属用户为自己的账号的修改联系人信息
            db.query('UPDATE tb_contact SET name=?, sex=?, mobile=?, email=?, qq=?, weixin=?, company=?, address=?, post_code=? WHERE id =?', [req.body.name, req.body.sex, req.body.mobile, req.body.email, req.body.qq, req.body.weixin, req.body.company, req.body.address, req.body.post_code, req.body.id], (err, rows) => {
                if (err) res.fail(err)
                res.send({
                    status: 0,
                    message: '更新联系人成功！'
                })
            })
        } else {
            return res.fail('无权修改他用户的联系人数据！')
        }
    })

}


exports.delete_contact = (req, res) => {
    let userId = req.auth.id
    let flag = false
    db.query('SELECT role FROM tb_user WHERE id=?', userId, (err, rows) => {
        if (rows[0].role === '管理员') {
            flag = true
        }
    })
    db.query('SELECT user_id FROM tb_contact WHERE id=?', req.body.id, (err, rows) => {
        if (rows[0].user_id === userId || flag) {   // 注释同上
            db.query('DELETE FROM tb_contact WHERE id =?', [req.body.id], (err, rows) => {
                if (err) res.fail(err)
                res.send({
                    status: 0,
                    message: '删除数据成功！'
                })
            })

        } else {
            return res.fail('无权删除他用户的联系人数据！')

        }
    })


}
