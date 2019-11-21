let getJSON = function (url, params, callback) {
    let xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");

    xhr.responseType = 'json';
    xhr.onload = function () {
        const status = xhr.status;
        if (status === 200) {
            callback(null, xhr.response);
        } else {
            callback(status, xhr.response);
        }
    };
    xhr.send(params);
};

function create_user() {
	// TODO: Check stuff (passwords match, strong enough, whatever
	// else, I don't know)
	const first_name = document.getElementById('first_name').value;
	const last_name = document.getElementById('last_name').value;
	const email = document.getElementById('email').value;
	const username = document.getElementById('username').value;
	const password = document.getElementById('password').value;
	const password_confirm = document.getElementById('confirm').value;
	const skype = document.getElementById('skype').value;
	const user_type = document.getElementById('user_type').value;
	const grade_level = document.getElementById('grade_level').value;

	const params = JSON.stringify({first_name: first_name, last_name: last_name, email: email, username: username, password: password, skype: skype, is_teacher: user_type === 'teacher', grade_level: grade_level});
	getJSON('/create', params,
		function(err, data) {
			if (err !== null) {
				console.log('Error retrieving data: ' + err);
			} else {
				if (data['exists']) {
					alert('Username is already in use.');
				} else {
					console.log('User creation success.');
				}
				// TODO
			}
		});

}
