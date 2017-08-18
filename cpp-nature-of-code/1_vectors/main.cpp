#include "Vector2Math.h"
#include <SFML/Graphics.hpp>

int main()
{
	constexpr int kWidth{ 640 };
	constexpr int kHeight{ 360 };
	constexpr int kFramerateSec{ 60 };
	constexpr float kTimestep{ 1.0f / kFramerateSec };

	sf::RenderWindow window(sf::VideoMode(kWidth, kHeight), "Vectors");
	sf::Clock clock;
	sf::Clock deltaTime;
	float elapsed{ 0.f };

	sf::Vector2f location{ 0, 0 };
	sf::Vector2f velocity{ 0, 0 };
	sf::Vector2f accel{ -0.1f, 1.f };

	sf::CircleShape shape(25.f);
	shape.setFillColor(sf::Color{ 130, 130, 130 });
	shape.setOutlineThickness(-2.f);
	shape.setOutlineColor(sf::Color::Black);
	shape.setOrigin(shape.getRadius() / 2, shape.getRadius() / 2);

	velocity *= 60.f;
	accel *= 120.f;

	while (window.isOpen()) {
		sf::Event event;
		while (window.pollEvent(event)) {
			if (event.type == sf::Event::Closed) {
				window.close();
			}
		}

		/// Start Tick
		if (elapsed > kTimestep) {
			float dt = deltaTime.restart().asSeconds();

			velocity += accel * dt;
			velocity = Vec2Math::limit(velocity, 600.f);
			location += velocity * dt;

			if (location.x > kWidth) {
				location.x = 0;
			}
			else if (location.x < 0) {
				location.x = kWidth;
			}

			if (location.y > kHeight) {
				location.y = 0;
			}
			else if (location.y < 0) {
				location.y = kHeight;
			}

			shape.setPosition(location);

			elapsed -= kTimestep;
		}
		/// End Tick

		/// Start Draw
		window.clear(sf::Color::White);
		window.draw(shape);
		window.display();
		/// End Draw

		elapsed += clock.restart().asSeconds();
	}

	return 0;
}