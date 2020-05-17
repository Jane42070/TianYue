window.onload = function () {
	var oBtn1 = document.getElementById('NextStep')
	var oBtn2 = document.getElementById('resetBtn')
	var oStep1 = document.getElementById('step1')
	var oStep2 = document.getElementById('step2')
	var oStep3 = document.getElementById('step3')
	var oLine1 = document.getElementById('line1')
	var oLine2 = document.getElementById('line2')
	var oLink = document.getElementById('stepcss')
	var iStep = 1

	oLine1.classList = 'line-state line-state-ok-1'

	oBtn1.onclick = function () {
		var uid = $('#uid').val()
		var uemail = $('#oEm').val()
		if (uid.length < 5 || uemail.length < 6) {
			iStep = 1
		}
		else {
			iStep += 1
		}

		if (iStep == 2) {
			oStep1.classList = 'step stepcurrent'
			oStep2.classList = 'step stepcurrent'
			oLine1.classList = 'line-state line-state-ok-2'
			oLine2.classList = 'line-state line-state-ok-1'
			oLink.href = '/static/css/register_step2.css'
		}
		else if (iStep == 1) {
			alert('请按规范输入账号和密码！')
		}
		else {
			oStep2.classList = 'step stepcurrent'
			oStep3.classList = 'step stepcurrent'
			oLine2.classList = 'line-state line-state-ok-2'
			oLink.href = '/static/css/register_step3.css'
		}
	}

	oBtn2.onclick = function () {
		location.href = '/login'
	}
	var oDiv = document.getElementById('logo')
	oDiv.onclick = function () {
		location.href = '/login'
	}
}
