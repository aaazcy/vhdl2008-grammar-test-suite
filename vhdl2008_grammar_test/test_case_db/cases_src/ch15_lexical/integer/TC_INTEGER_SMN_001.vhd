-- =============================================================
-- Case ID: TC_INTEGER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: Integer used for a real port assignment causing type mismatch — assigning an integer literal to a real type signal needs no explicit conversion, but a negative value to a natural subtype raises an error
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity int_smn_001 is
  port (
    val_out : out natural
  );
end entity int_smn_001;

architecture rtl of int_smn_001 is
  constant C_NEG : natural := -5;
begin
  val_out <= C_NEG;
end architecture rtl;
