const books = {
  fiction: [
    { title: "To Kill a Mockingbird", author: "Harper Lee" },
    { title: "1984", author: "George Orwell" },
    { title: "The Great Gatsby", author: "F. Scott Fitzgerald" }
  ],
  science: [
    { title: "A Brief History of Time", author: "Stephen Hawking" },
    { title: "The Selfish Gene", author: "Richard Dawkins" },
    { title: "The Gene: An Intimate History", author: "Siddhartha Mukherjee" }
  ],
  history: [
    { title: "Sapiens: A Brief History of Humankind", author: "Yuval Noah Harari" },
    { title: "Guns, Germs, and Steel", author: "Jared Diamond" },
    { title: "The Diary of a Young Girl", author: "Anne Frank" }
  ],
  selfhelp: [
    { title: "Atomic Habits", author: "James Clear" },
    { title: "The 7 Habits of Highly Effective People", author: "Stephen Covey" },
    { title: "The Power of Now", author: "Eckhart Tolle" }
  ]
};

document.getElementById("recommendBtn").addEventListener("click", function() {
  const genre = document.getElementById("genre").value;
  const recommendations = document.getElementById("recommendations");

  recommendations.innerHTML = ""; // Clear old results

  if (!genre) {
    recommendations.innerHTML = "<p>Please select a genre!</p>";
    return;
  }

  const selectedBooks = books[genre];
  let output = `<h3>Recommended ${genre.charAt(0).toUpperCase() + genre.slice(1)} Books:</h3>`;

  selectedBooks.forEach(book => {
    output += `
      <div class="book">
        <strong>${book.title}</strong><br>
        <em>by ${book.author}</em>
      </div>
    `;
  });

  recommendations.innerHTML = output;
});
