#pragma once 

namespace Hemera {

	class Core {
	public:
		Core();
		~Core();

		void Run();

	private:
		bool m_Running = true;
	};

}