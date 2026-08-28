-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: rol rotate left and ror rotate right — an 8-bit bit_vector rotated (bits shifted out wrap around into the other end), verifying the syntax of the rol/ror rotate operators as shift_operator in expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_rol_ror is
  port (
    din   : in  bit_vector(7 downto 0);
    rol_o : out bit_vector(7 downto 0);
    ror_o : out bit_vector(7 downto 0)
  );
end entity ent_rol_ror;

architecture rtl of ent_rol_ror is
begin
  rol_o <= din rol 3;
  ror_o <= din ror 2;
end architecture rtl;
