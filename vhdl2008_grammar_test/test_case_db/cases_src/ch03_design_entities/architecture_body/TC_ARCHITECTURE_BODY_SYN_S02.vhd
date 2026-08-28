-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: architecture with use clause and library reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_spc2_ent is port(a:in bit; y:out bit); end entity;
architecture bh of arch_spc2_ent is
  function f_not(x:bit) return bit is begin return not x; end;
  signal s:bit;
begin
  s<=f_not(a); y<=s;
end architecture bh;
