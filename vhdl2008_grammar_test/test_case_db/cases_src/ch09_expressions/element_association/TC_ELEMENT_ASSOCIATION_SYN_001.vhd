-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: Minimal form: a positional element_association containing only an expression (no choices => prefix) — pure positional associations (1, 2, 3) in an array aggregate, verifying the minimal syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_minimal is
  port (
    x : out integer
  );
end entity ea_minimal;

architecture minimal of ea_minimal is
  type t_vec3 is array(0 to 2) of integer;
  signal s_v : t_vec3;
begin
  s_v <= (1, 2, 3);  -- positional element_association: expression only
  x <= s_v(0) + s_v(1) + s_v(2);
end architecture minimal;
