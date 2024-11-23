function toggleSidebar() {
    const sidebar = document.querySelector('.sidebar');
    const container = document.querySelector('.container-m');

    // Kiểm tra trạng thái hiển thị của sidebar
    if (sidebar.style.display === 'block') {
        sidebar.style.display = 'none';
        container.classList.remove('expanded');
    } else {
        sidebar.style.display = 'block';
        container.classList.add('expanded');
    }
}