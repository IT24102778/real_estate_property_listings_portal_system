<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Review</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        .star { cursor: pointer; font-size: 1.8rem; transition: color 0.2s ease; }
        .error-msg { display: none; color: #ef4444; font-size: 0.75rem; margin-top: 0.25rem; }
        .char-counter { font-size: 0.75rem; color: #6b7280; margin-top: 0.25rem; }
    </style>
    <script>
        function updateStars(rating) {
            for (let i = 1; i <= 5; i++) {
                document.getElementById('star' + i).style.color = i <= rating ? '#facc15' : '#d1d5db';
            }
            document.getElementById('rating').value = rating;
            validateField('rating');
        }

        function validateField(fieldId) {
            const userid = document.getElementsByName("userid")[0].value.trim();
            const name = document.getElementsByName("name")[0].value.trim();
            const feedback = document.getElementsByName("feedback")[0].value.trim();
            const rating = parseInt(document.getElementById('rating').value);
            let isValid = true;

            // Validate User ID
            if (fieldId === 'userid' || fieldId === 'all') {
                if (userid.length < 5 || userid.length >= 15) {
                    document.getElementById('userid-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('userid-error').style.display = 'none';
                }
            }

            // Validate Name
            if (fieldId === 'name' || fieldId === 'all') {
                if (name.length === 1 || name.length >= 50) {
                    document.getElementById('name-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('name-error').style.display = 'none';
                }
            }

            // Validate Feedback
            if (fieldId === 'feedback' || fieldId === 'all') {
                if (feedback.length < 10 || feedback.length >= 100) {
                    document.getElementById('feedback-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('feedback-error').style.display = 'none';
                }
            }

            // Validate Rating
            if (fieldId === 'rating' || fieldId === 'all') {
                if (isNaN(rating) || rating < 1 || rating > 5) {
                    document.getElementById('rating-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('rating-error').style.display = 'none';
                }
            }

            return isValid;
        }

        function validateForm(event) {
            const isValid = validateField('all');
            if (!isValid) {
                event.preventDefault();
                alert("Please correct the errors in the form before submitting.");
                return false;
            }
            alert("Form validated successfully, submitting...");
            return true;
        }

        // Character counter for feedback
        function updateCharCount() {
            const feedback = document.getElementsByName("feedback")[0].value;
            const charCount = document.getElementById('char-count');
            charCount.textContent = `${feedback.length}10 - 100 characters`;
            if (feedback.length < 10 || feedback.length >= 100) {
                charCount.style.color = '#ef4444';
            } else {
                charCount.style.color = '#6b7280';
            }
        }
    </script>
</head>
<body class="bg-gray-50 text-gray-800 font-sans p-6" onload="updateCharCount()">
<div class="max-w-xl mx-auto bg-white shadow-md rounded-2xl p-6 mt-10">
    <div class="flex items-center mb-6">
        <i data-lucide="star" class="w-6 h-6 text-yellow-500 mr-2"></i>
        <h2 class="text-2xl font-semibold text-gray-700">Add Your Review</h2>
    </div>
    <form action="review" method="post" class="space-y-5" onsubmit="return validateForm(event)">
        <div>
            <label class="block text-gray-600 mb-1">User ID</label>
            <input type="text" name="userid" required class="w-full p-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-300" oninput="validateField('userid')">
            <span id="userid-error" class="error-msg">User ID must be 5-15 characters.</span>
        </div>
        <div>
            <label class="block text-gray-600 mb-1">Name</label>
            <input type="text" name="name" required class="w-full p-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-300" oninput="validateField('name')">
            <span id="name-error" class="error-msg">Name must be 1-50 characters.</span>
        </div>
        <div>
            <label class="block text-gray-600 mb-1">Feedback <span class="text-gray-400">( 10 - 100 characters)</span></label>
            <textarea name="feedback" rows="4" required class="w-full p-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-300" oninput="validateField('feedback'); updateCharCount()" maxlength="100"></textarea>
            <span id="feedback-error" class="error-msg">Feedback must be between 10 and 100 characters.</span>
        </div>
        <div>
            <label class="block text-gray-600 mb-1">Rating</label>
            <div class="space-x-1">
                <span onclick="updateStars(1)" id="star1" class="star text-gray-300">☆</span>
                <span onclick="updateStars(2)" id="star2" class="star text-gray-300">☆</span>
                <span onclick="updateStars(3)" id="star3" class="star text-gray-300">☆</span>
                <span onclick="updateStars(4)" id="star4" class="star text-gray-300">☆</span>
                <span onclick="updateStars(5)" id="star5" class="star text-gray-300">☆</span>
            </div>
            <span id="rating-error" class="error-msg">Select a rating between 1 and 5.</span>
        </div>
        <input type="hidden" name="rating" id="rating" value="0">
        <div class="flex justify-end">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-5 py-2 rounded-xl shadow inline-flex items-center">
                <i data-lucide="send" class="w-5 h-5 mr-2"></i> Submit Review
            </button>
        </div>
    </form>
</div>
<script>lucide.createIcons();</script>
</body>
</html>