-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: mixed use of entity_class_entry with and without box in the same group template — in "signal <>, label" the signal has box while label does not, verifies the parser supports mixed box forms in a single group template
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity ece_mixed_box is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of ece_mixed_box is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand : gate_nand use entity work.gate_nand(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s_int : bit := '0';
  group mixed_path is (signal, label);
  group mp : mixed_path (s_int, u_nand);
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
  s_int <= not y;
end architecture rtl;
