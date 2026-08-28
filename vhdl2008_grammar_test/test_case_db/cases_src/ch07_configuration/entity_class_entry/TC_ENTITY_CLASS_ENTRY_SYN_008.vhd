-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: "component <>" and "label <>" in entity_class_entry used for architecture grouping — the group template contains two entity_class forms, component and instance label, both with box, verifies the grouping semantics in a structural design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity gate_xor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity ece_comp_label_box is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture rtl of ece_comp_label_box is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for u_xor : gate_xor use entity work.gate_xor(rtl)
    port map(x1=>c, x2=>d, z=>y2);
  group comp_inst is (component, label <>);
  group ci_nor : comp_inst (gate_nor, u_nor);
  group ci_xor : comp_inst (gate_xor, u_xor);
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y1);
  u_xor : gate_xor port map(x1=>c, x2=>d, z=>y2);
end architecture rtl;
