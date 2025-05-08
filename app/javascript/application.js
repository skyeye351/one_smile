// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", () => {
  // ハンバーガーメニュー
  const navToggle = document.getElementById("nav-toggle");
  const navMenu = document.getElementById("nav-menu");

  if (navToggle && navMenu) {
    navToggle.addEventListener("click", () => {
      navMenu.classList.toggle("hidden");
    });
  } else {
  }

  // プロフィールメニュー（クリックで開閉）
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
});
