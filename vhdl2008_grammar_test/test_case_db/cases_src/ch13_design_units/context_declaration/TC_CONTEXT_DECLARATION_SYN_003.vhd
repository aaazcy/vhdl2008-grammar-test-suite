-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: minimal form: context id is end; — empty context_clause ({context_item} zero times), no context keyword and no context_simple_name after end, verifying the minimal compilable context_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_minimal is
end;

entity cd_min_ent is
  port(a: in bit; y: out bit);
end entity cd_min_ent;

architecture rtl of cd_min_ent is
begin
  y <= a;
end architecture rtl;
