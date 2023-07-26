within OpenWasteWater.ASM3;

package Scenarios
  model Scenario1
    parameter Real Q1 = 5000;
    WWTP_Examples.FlexTreat FT(L1.B_Q = Q1);
    annotation(
      experiment(StartTime = 0, StopTime = 212, Tolerance = 1e-06, Interval = 0.424));
  end Scenario1;

  model Scenario2
    parameter Real Q1 = 500;
    WWTP_Examples.FlexTreat FT(L1.B_Q = Q1);
    annotation(
      experiment(StartTime = 0, StopTime = 212, Tolerance = 1e-06, Interval = 0.424));
  end Scenario2;
  
  model Scenario3
    OpenWasteWater.ASM3.Inflow Inflow(Inf_File = "C:/Users/tamim/Documents/GitHub/OpenWasteWater/Resources/ASM3/Hughada.txt") annotation(
      Placement(visible = true, transformation(origin = {-92, 49}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  OpenWasteWater.ASM3.Divider2 D1 annotation(
    Placement(visible = true, transformation(origin = {-82, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenWasteWater.ASM3.Mixer2 M1 annotation(
    Placement(visible = true, transformation(origin = {44, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenWasteWater.ASM3.Mixer2 M2 annotation(
    Placement(visible = true, transformation(origin = {46, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenWasteWater.ASM3.Sub_WWTP_Modells.Lane L1(AT_H = 4.6, AT_V = 59.670, B_Q = 10000, RP_Q = 10000, SC_A = 1733.62, SC_z = 4.6, WP_Q = 285) annotation(
    Placement(visible = true, transformation(origin = {-42, 32}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  OpenWasteWater.ASM3.Sub_WWTP_Modells.Lane L2(AT_H = 4.6, AT_V = 59.670, B_Q = 10000, RP_Q = 10000, SC_A = 1733.62, SC_z = 4.6, WP_Q = 285) annotation(
    Placement(visible = true, transformation(origin = {-42, 2}, extent = {{-15, -10}, {15, 10}}, rotation = 0))); 
  OpenWasteWater.ASM3.WasteSludge Waste annotation(
    Placement(visible = true, transformation(origin = {86, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenWasteWater.ASM3.Effluent Outflow annotation(
    Placement(visible = true, transformation(origin = {86, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
   
equation
  connect(Inflow.Out1, D1.In1) annotation(
      Line(points = {{-82, 42}, {-82, 37}, {-92, 37}, {-92, 24}}));

  connect(D1.Out1, L1.In1) annotation(
  Line(points = {{-73, 27}, {-73, 38.5}, {-54.5, 38.5}}));
  connect(D1.Out2, L2.In1) annotation(
  Line(points = {{-73, 22.5}, {-73, 8.5}, {-54.5, 8.5}}));
  D1.Out1.Q = D1.Out2.Q;

  connect(L1.Out1, M1.In2) annotation(
      Line(points = {{-29, 31}, {-11, 31}, {-11, 28.5}, {34, 28.5}}));
  connect(L2.Out1, M1.In1) annotation(
      Line(points = {{-29, 1}, {4, 1}, {4, 24.5}, {34, 24.5}})); 
  connect(L1.Out2, M2.In2) annotation(
      Line(points = {{-30, 27}, {-30, 27.125}, {-19, 27.125}, {-19, 11.25}, {36, 11.25}, {36, -11.5}}));
  connect(L2.Out2, M2.In1) annotation(
      Line(points = {{-30, -3}, {-10, -3}, {-10, -15.5}, {36, -15.5}}));
  
  connect(M1.Out1, Outflow.In1) annotation(
  Line(origin = {65, 26}, points = {{-11, 0}, {11, 0}}));
  connect(M2.Out1, Waste.In1) annotation(
  Line(origin = {66, -14}, points = {{-10, 0}, {10, 0}}));

  
  annotation(
      Diagram,
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end Scenario3;
end Scenarios;
