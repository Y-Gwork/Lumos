#include "LM.h"
#include "CameraComponent.h"
#include "ECS/EntityManager.h"
#include "Graphics/Camera/Camera.h"
#include "App/Application.h"

#include <imgui/imgui.h>

namespace Lumos
{
    CameraComponent::CameraComponent()
    {
        m_Camera = nullptr;
    }
    
	CameraComponent::CameraComponent(Camera* camera)
		: m_Camera(camera)
	{
		m_Name = "Camera";
	}

	void CameraComponent::OnUpdateComponent(float dt)
	{
	}

    void CameraComponent::OnIMGUI()
    {
		if (ImGui::Button("Set Active"))
			SetAsMainCamera();

		m_Camera->OnImGUI();
    }

	void CameraComponent::SetAsMainCamera()
	{
		Application::Instance()->SetActiveCamera(m_Camera);
	}
}