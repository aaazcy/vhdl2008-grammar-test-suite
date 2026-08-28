-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association inside nested aggregates: the 2D array (0=> (0=>1, others=>0), others=> (others=>0)) — the elements inside each inner pair of parentheses are also element_associations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_nested is
  port (
    x : out integer
  );
end entity ea_nested;

architecture nested_agg of ea_nested is
  type t_mat2x2 is array(0 to 1, 0 to 1) of integer;
  signal s_mat : t_mat2x2;
begin
  s_mat <= (0 => (0 => 1, 1 => 2), 1 => (0 => 3, 1 => 4));
  x <= s_mat(0,0) + s_mat(0,1) + s_mat(1,0) + s_mat(1,1);
end architecture nested_agg;
