-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with entity_aspect only (no generic_map_aspect, no port_map_aspect) — exercises minimal binding form: only "use entity work.comp(arch)" without any map clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture beh of gate_nand is
begin
end architecture beh;

entity bi_entity_only is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of bi_entity_only is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand : gate_nand use entity work.gate_nand(beh);
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
end architecture bh;
