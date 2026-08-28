-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_002
-- Rule Type: Syntax
-- BNF Production: element_association
-- IEEE Section: 9.3.3.1
-- BNF Text: element_association ::= [ choices => ] expression
-- Test Focus: missing element in aggregate - fewer positional elements than target array size
-- Case Type: Negative
-- Expected Result: Triggers semantic error (aggregate element count mismatch)
-- Dependencies: None
-- =============================================================
entity tc_element_association_snn_002 is
  port (
    addr  : in  integer range 0 to 3;
    data  : out integer
  );
end entity tc_element_association_snn_002;

architecture error of tc_element_association_snn_002 is
  type t_arr4 is array(0 to 3) of integer;
  -- ERROR: aggregate only supplies 2 elements, but array has 4 positions
  signal arr : t_arr4 := (10, 20);
begin
  data <= arr(addr);
end architecture error;
