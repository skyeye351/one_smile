import "@hotwired/turbo-rails";
import "./controllers";

document.addEventListener("turbo:load", () => {
  // ハンバーガーメニュー
  const navToggle = document.getElementById("nav-toggle");
  const navMenu = document.getElementById("nav-menu");
  if (navToggle && navMenu) {
    navToggle.addEventListener("click", () => {
      navMenu.classList.toggle("hidden");
    });
  }

  // プロフィールメニュー
  const profileToggle = document.getElementById("profile-toggle");
  const profileMenu = document.getElementById("profile-menu");
  if (profileToggle && profileMenu) {
    profileToggle.addEventListener("click", (e) => {
      e.stopPropagation();
      profileMenu.classList.toggle("hidden");
    });

    document.addEventListener("click", (e) => {
      if (!profileMenu.contains(e.target) && !profileToggle.contains(e.target)) {
        profileMenu.classList.add("hidden");
      }
    });
  }

  // ファイル選択で画像プレビュー
  const fileInput = document.querySelector('input[type="file"][name="user[avatar]"]');
  const preview = document.getElementById('preview');
  if (fileInput && preview) {
    // ファイルが変更されたときだけプレビューを動作させる。
    fileInput.addEventListener("change", (event) => {
      const input = event.target;
      if (input.files && input.files[0]) {
        const reader = new FileReader(); // 選択した画像をブラウザ上で読み取り、プレビュー表示
        reader.onload = (e) => {
          preview.src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
      }
    });
  }
});
