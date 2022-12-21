const db = require('../db/index')
const bcrypt = require('bcryptjs')

exports.getUserInfo = (req, res) => {
    db.query('SELECT id, name, nick_name, role FROM tb_user WHERE name=?', [req.body.name], (err, rows) => {
            if (err) return res.fail(err)
            if (rows[0].length === 0) return res.fail('用户不存在！')
            res.send({
                status: 0,
                message: '获取用户基本信息成功！',
                data: rows[0]
            })
        }
    )
}
exports.get_role = (req, res) => {
    db.query('SELECT role FROM tb_user WHERE id=?', [req.auth.id], (err, rows) => {
            if (err) return res.fail(err)
            res.send({
                status: 0,
                message: '获取用户权限成功！',
                data: rows[0]
            })
        }
    )
}


exports.get_user = (req, res) => {

    db.query('SELECT role FROM tb_user WHERE id =?', [req.auth.id], (err, rows) => {
            if (err) return res.fail(err)
            if (rows[0].role === '管理员') {   // 判断权限
                let query = ''
                if (req.body.query === null || req.body.query === undefined) {
                    query = '%%'
                } else {
                    query = `%${req.body.query}%`
                }
                // 利用模糊查询实现搜索功能，用LIMIT实现分页功能 COUNT数据获取总数
                let sql = `SELECT id,name,nick_name,role FROM tb_user WHERE name LIKE '${query}' LIMIT ${(req.body.pagenum-1)*req.body.pagesize}, ${req.body.pagesize}`
                let sql_total = `SELECT COUNT(*) AS total FROM tb_user WHERE name LIKE '${query}'`
                db.query(sql, (err, rows) => {
                    if (err) res.fail(err)
                    let data_row = rows
                    db.query(sql_total, (err, rows) => {
                        res.send({
                            status: 0,
                            message: '获取用户数据成功！',
                            total: rows[0].total,
                            data: data_row

                        })
                    })

                })

            } else {
                return res.fail('无权限获取用户数据！')
            }

        }
    )
}


exports.add_user = (req, res) => {
    db.query('SELECT role FROM tb_user WHERE id =?', [req.auth.id], (err, rows) => {
            if (err) return res.fail(err)
            if (rows[0].role === '管理员') {
                db.query('SELECT COUNT(*) as count FROM tb_user WHERE name =?', [req.body.name], (err, rows) => {
                    if (rows[0].count === 1) return res.fail('名字重复！')  // 防止主键重复
                    let password = bcrypt.hashSync(req.body.password, 10)
                    let sql = 'INSERT INTO tb_user(name, nick_name, password, role) VALUES (?,?,?,?)'
                    db.query(sql, [req.body.name, req.body.nick_name, password, req.body.role], (err, results) => {
                        if (err) res.fail(err)
                        res.send({
                            status: 0,
                            message: '添加新用户成功！'
                        })
                    })
                })


            } else {
                return res.fail('无权限添加用户信息！')
            }

        }
    )
}


exports.update_user = (req, res) => {
    db.query('SELECT role FROM tb_user WHERE id =?', [req.auth.id], (err, rows) => {
            if (err) return res.fail(err)
            if (rows[0].role === '管理员') {
                db.query('UPDATE tb_user SET name=? ,nick_name=?, role=? WHERE id =?', [req.body.name, req.body.nick_name, req.body.role, req.body.id], (err, rows) => {
                    if (err) res.fail(err)
                    res.send({
                        status: 0,
                        message: '更新数据成功！'
                    })
                })

            } else {
                return res.fail('无权限修改用户数据！')
            }

        }
    )
}


exports.delete_user = (req, res) => {
    db.query('SELECT role FROM tb_user WHERE id =?', [req.auth.id], (err, rows) => {
            if (err) return res.fail(err)
            if (rows[0].role === '管理员') {
                db.query('DELETE FROM tb_user WHERE id =?', [req.body.id], (err, rows) => {
                    if (err) res.fail(err)
                    res.send({
                        status: 0,
                        message: '删除数据成功！'
                    })
                })

            } else {
                return res.fail('无权限删除用户数据！')
            }

        }
    )
}
