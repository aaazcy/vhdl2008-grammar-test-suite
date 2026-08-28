-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Nested aggregate for a two-dimensional array: the aggregate ((1,2),(3,4)) of the 2x2 matrix t_mat — the outer positional aggregate contains two inner positional aggregates, verifying the element_association syntax of nested aggregates
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity agg_2d_nested is
  port (
    diag_sum : out integer
  );
end entity agg_2d_nested;

architecture matrix2x2 of agg_2d_nested is
  type t_mat is array(0 to 1, 0 to 1) of integer;
  signal s : t_mat;
begin
  s <= ((1, 2), (3, 4));
  diag_sum <= s(0, 0) + s(1, 1);
end architecture matrix2x2;
