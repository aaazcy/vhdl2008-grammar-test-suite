-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: mixed positional and named associations: in the aggregate the first two use positional (expression only) and the rest use named (choices => expression), verifying that the mixed form is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_mixed is
  port (
    sel : in  integer range 0 to 3;
    x   : out integer
  );
end entity ea_mixed;

architecture mixed_assoc of ea_mixed is
  type t_reg is record
    a, b, c, d : integer;
  end record t_reg;
  signal s_r : t_reg;
begin
  -- mixed: first positional (a,b), then named (c,d)
  s_r <= (sel*1, sel*2, c => sel*3, d => sel*4);
  x <= s_r.a + s_r.b + s_r.c + s_r.d;
end architecture mixed_assoc;
