#include <Include.h>

class Application : public Hemera::Core {
public:
	Application() {
	}
	~Application() {

	}
};

Hemera::Core* CreateApplication() {
	return new Application();
}