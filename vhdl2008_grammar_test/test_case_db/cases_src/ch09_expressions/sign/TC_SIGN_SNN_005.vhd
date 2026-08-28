-- =============================================================
-- Case ID: TC_SIGN_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Test Focus: SNN: plus sign + used on bit_vector type — attempt to apply the unary + to a bit_vector, verifying that sign applies only to numeric types, bit_vector is not numeric and cannot take a sign
-- Expected Result: Triggers semantic error: sign requires numeric type, bit_vector is not numeric
-- Dependencies: None
-- =============================================================
entity ent_snn_sign_bv is
  port (
    a_i : in  bit_vector(3 downto 0);
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_snn_sign_bv;

architecture rtl of ent_snn_sign_bv is
begin
  -- ERROR: sign operator requires numeric type, bit_vector is not numeric
  y_o <= +a_i;
end architecture rtl;
