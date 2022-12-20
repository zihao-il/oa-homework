const config = require('../config')
const db = require('../db/index')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')


exports.regUser = (req, res) => {
    let username = req.body.username
    let password = req.body.password
    db.query('SELECT count(*) AS count FROM tb_user WHERE name=?', [username], (err, rows) => {
        if (err) return res.fail(err)
        if (rows[0].count === 1) return res.fail('用户名重复！')
        let sql = "INSERT INTO tb_user ( name, password ) VALUES (?,?)"
        password = bcrypt.hashSync(password, 10)
        let sqlData = [username, password]
        db.query(sql, sqlData, function (err, result) {
            if (err) return res.fail(err)
            if (result.affectedRows !== 1) return res.fail('用户注册失败！')
            res.send({status: 0, massage: '用户注册成功！'})
        })

    })

}

// 登录的处理函数
exports.login = (req, res) => {
    let username = req.body.username
    let password = req.body.password
    db.query('SELECT * FROM tb_user WHERE name=?', [username], (err, rows) => {
        if (err) return res.fail(err)
        if (rows.length !== 1) return res.fail('登录失败！')
        let compareResult = bcrypt.compareSync(password, rows[0].password)
        if (!compareResult) {
            return res.fail('登录失败！')
        }
        let user = {
            id: rows[0].id,
            username: rows[0].username,
            nickname: rows[0].nickname,
            email: rows[0].email
        }
        
        let tokenStr = jwt.sign(user, config.jwtSecretKey, {
            expiresIn: '12h'
        })
        res.send({
            status: 0,
            message: '登录成功！',
            token: 'Bearer ' + tokenStr
        })
    })
}
