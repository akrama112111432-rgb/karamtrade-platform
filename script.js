// وضع السنة في الفوتر
document.getElementById('year').innerText = new Date().getFullYear();

// فتح نافذة تسجيل الدخول
const modal = document.getElementById('modal');
document.getElementById('openLogin').addEventListener('click', ()=> modal.classList.remove('hidden'));
function closeModal(){ modal.classList.add('hidden'); }

// وظيفة تسجيل دخول تجريبية
function login(e){
  e.preventDefault();
  const user = document.getElementById('user').value;
  alert('مرحباً ' + user + ' — تسجيل الدخول تجريبي فقط.');
  closeModal();
}

// نموذج تواصل تجريبي
function submitContact(e){
  e.preventDefault();
  const name = document.getElementById('name').value;
  alert('شكراً يا ' + name + '. تم استلام رسالتك (تجريبي).');
  document.getElementById('contactForm').reset();
}

// أزرار إضافية
document.getElementById('learnMore').addEventListener('click', ()=> {
  document.getElementById('features').scrollIntoView({behavior:'smooth'});
});
document.getElementById('tradeNow').addEventListener('click', ()=> {
  alert('نافذة التداول التجريبية (قريباً)');
});
