-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Test Focus: SNN: the number of aggregate elements exceeds the array length — 4 positional elements provided for a 3-bit vector, verifying that the number of aggregate elements must not exceed the range of the target array
-- Expected Result: Triggers semantic error: too many elements in aggregate for target type
-- Dependencies: None
-- =============================================================
entity ent_snn_too_many is
  port (
    a_i : in  bit;
    b_i : in  bit;
    c_i : in  bit;
    d_i : in  bit;
    y_o : out bit_vector(2 downto 0)
  );
end entity ent_snn_too_many;

architecture rtl of ent_snn_too_many is
begin
  -- ERROR: 4 elements for 3-bit vector aggregate
  y_o <= (a_i, b_i, c_i, d_i);
end architecture rtl;
