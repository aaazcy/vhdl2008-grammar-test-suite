-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: xor operator used for parity generation — 8-bit data XORed bit by bit to produce the parity bit, implemented in a process by accumulating xor in a variable, verifying the nested use of xor in bit_vector bitwise operations and bit variables
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_xor_parity is
  port (
    data_i  : in  bit_vector(7 downto 0);
    valid_i : in  bit;
    parity_o: out bit
  );
end entity ent_xor_parity;

architecture rtl of ent_xor_parity is
begin
  process(data_i, valid_i)
    variable v_parity : bit := '0';
  begin
    v_parity := '0';
    for i in data_i'range loop
      v_parity := v_parity xor data_i(i);
    end loop;
    parity_o <= v_parity and valid_i;
  end process;
end architecture rtl;
