-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: Entity class entry without box — exercises the basic form "entity_class" (no "<>") in a group template declaration with signal and label classes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity ece_no_box is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ece_no_box is
  group pin_group is (signal, label);
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y);
  group my_pins : pin_group (y, u_nor);
  signal s_x : bit := '0';
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
  s_x <= not y;
end architecture bh;
