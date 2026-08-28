-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Production-specific isolation: the "range range" syntax
--   verified by placing a range_constraint directly in an integer
--   type definition and a subtype. Verifies both the first "range"
--   keyword and the embedded range nonterminal are consumed.
-- Expected Result: Compiles; two constrained subtypes coexist
-- Dependencies: None
-- =============================================================
entity range_constraint_isolated is
  port (
    a : in  integer;
    b : out integer
  );
end entity range_constraint_isolated;

architecture isolate_range_range of range_constraint_isolated is
  type t_core is range 0 to 1023;
  subtype t_half is t_core range 0 to 511;
  subtype t_rest is t_core range 512 to 1023;
  signal s_half : t_half := 0;
  signal s_rest : t_rest := 512;
begin
  s_half <= t_half(a mod 512);
  s_rest <= t_rest(512 + (a mod 512));
  b <= integer(s_half) + integer(s_rest);
end architecture isolate_range_range;
