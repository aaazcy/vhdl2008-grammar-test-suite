-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- BNF Production: ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: Entity designator as simple name without signature — exercises entity_tag as a plain identifier (signal name) in attribute specification context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_simple_tag is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ed_simple_tag is
  signal s_a, s_b : bit := '0';
  attribute fanout : integer;
  attribute fanout of s_a : signal is 2;
begin
  s_a <= a; s_b <= b;
  y <= s_a nand s_b;
end architecture bh;
