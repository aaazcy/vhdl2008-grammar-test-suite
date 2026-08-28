-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: architecture with configuration specification inside
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity arch_spc_ent is port(a:in bit; y:out bit); end entity;
architecture rtl of arch_spc_ent is
  component inv is port(x:in bit; z:out bit); end component;
  for u_inv:inv use entity work.inv(rtl);
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture rtl;
