-- =============================================================
-- Case ID: TC_PRIMARY_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: primary ::= name | literal | aggregate | function_call | qualified_expression | type_conversion | allocator | ( expression )
-- Case Type: Positive
-- Test Focus: ( expression ) parenthesized form: primary is the parenthesized logical expression (a < b), where the parentheses change precedence
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_paren_ent is
  port(a, b : in integer; c : in boolean; r : out boolean);
end entity;
architecture rtl of prim_paren_ent is
begin
  r <= (a < b) and c;
end architecture rtl;
