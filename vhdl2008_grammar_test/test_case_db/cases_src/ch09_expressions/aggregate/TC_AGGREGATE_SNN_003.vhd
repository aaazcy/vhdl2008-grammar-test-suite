-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Test Focus: SNN: extra comma at the end of an aggregate — "(a, b, c,)" has a comma after the last element, verifying that the comma in an aggregate is an element separator and no dangling comma is allowed at the end
-- Expected Result: Triggers syntax error: trailing comma in aggregate element list
-- Dependencies: None
-- =============================================================
entity ent_snn_trailing_comma is
  port (
    a_i : in  bit;
    b_i : in  bit;
    y_o : out bit_vector(1 downto 0)
  );
end entity ent_snn_trailing_comma;

architecture rtl of ent_snn_trailing_comma is
begin
  -- ERROR: trailing comma in aggregate element list
  y_o <= (a_i, b_i,);
end architecture rtl;
