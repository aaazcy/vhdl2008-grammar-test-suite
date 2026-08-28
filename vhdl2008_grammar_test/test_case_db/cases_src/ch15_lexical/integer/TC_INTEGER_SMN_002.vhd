-- =============================================================
-- Case ID: TC_INTEGER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Integer as array index but beyond the declared array range — semantically the index value is determined at compile time to be out of bounds
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_smn_002 is
  port (
    val_out : out bit
  );
end entity int_smn_002;

architecture rtl of int_smn_002 is
  type T_BYTE is array(0 to 7) of bit;
  signal s_arr : T_BYTE := (others => '0');
begin
  val_out <= s_arr(99);
end architecture rtl;
