const db = require('../db/index')

exports.get_schedule = (req, res) => {
    db.query('SELECT role FROM tb_user WHERE id =?', [req.auth.id], (err, rows) => {
        if (err) return res.fail(err)
        let query = ''
        let userId=''
        if (req.body.query === null || req.body.query === undefined) {
            query = '%%'
        } else {
            query = `%${req.body.query}%`
        }
        if (rows[0].role === '管理员') {
            userId= ''
        }else {
            userId= `user_id=${req.auth.id} AND`
        }

        let sql = `SELECT * FROM tb_schedule WHERE ${userId}  title LIKE '${query}' LIMIT ${(req.body.pagenum-1)*req.body.pagesize}, ${req.body.pagesize}`
        let total_sql = `SELECT COUNT(*) AS total FROM tb_schedule WHERE ${userId} title LIKE '${query}'`
        db.query(sql, (err, rows) => {
                if (err) return res.fail(err)
                let data_row = rows
                db.query(total_sql, (err, rows) => {
                    if (err) return res.fail(err)
                    res.send({
                        status: 0,
                        message: '获取日程信息成功！',
                        total: rows[0].total,
                        data: data_row
                    })
                })

            }
        )

    })

}

exports.add_schedule = (req, res) => {

    db.query('SELECT COUNT(*) as count FROM tb_schedule WHERE id =?', [req.body.id], (err, rows) => {
        if (rows[0].count === 1) return res.fail('ID重复！')
        let userId = req.auth.id
        let sql = 'INSERT INTO tb_schedule VALUES (?,?,?,?,?,?,?,?,?,?,?)'
        db.query(sql, [req.body.id, userId, req.body.start_time, req.body.end_time, req.body.title, req.body.content, req.body.level, req.body.remark, req.body.remind_datetime, req.body.remind_number, req.body.status], (err, results) => {
            if (err) res.fail(err)
            res.send({
                status: 0,
                message: '添加日程信息成功！'
            })
        })
    })

}

exports.update_schedule = (req, res) => {
    let userId = req.auth.id
    let flag = false
    db.query('SELECT role FROM tb_user WHERE id=?', userId, (err, rows) => {
        if (rows[0].role === '管理员') {
            flag = true
        }
    })
    db.query('SELECT user_id FROM tb_schedule WHERE id=?', req.body.id, (err, rows) => {
        if (rows[0].user_id === userId || flag) {
            db.query('UPDATE tb_schedule SET user_id=?, start_time=?, title=?, content=?, level=?, title=?, remark=?, remind_datetime=?, remind_number=?, status=? WHERE id =?', [req.body.user_id, req.body.start_time, req.body.end_time, req.body.title, req.body.content, req.body.level, req.body.remark, req.body.remind_datetime, req.body.remind_number, req.body.status, req.body.id], (err, rows) => {
                if (err) res.fail(err)
                res.send({
                    status: 0,
                    message: '修改日程信息成功！'
                })
            })
        } else {
            return res.fail('无权修改他用户的日程信息数据！')
        }
    })

}


exports.delete_schedule = (req, res) => {
    let userId = req.auth.id
    let flag = false
    db.query('SELECT role FROM tb_user WHERE id=?', userId, (err, rows) => {
        if (rows[0].role === '管理员') {
            flag = true
        }
    })
    db.query('SELECT user_id FROM tb_schedule WHERE id=?', req.body.id, (err, rows) => {
        if (rows[0].user_id === userId || flag) {
            db.query('DELETE FROM tb_schedule WHERE id =?', [req.body.id], (err, rows) => {
                if (err) res.fail(err)
                res.send({
                    status: 0,
                    message: '删除数据成功！'
                })
            })

        } else {
            return res.fail('无权删除他用户的日程信息数据！')

        }
    })


}