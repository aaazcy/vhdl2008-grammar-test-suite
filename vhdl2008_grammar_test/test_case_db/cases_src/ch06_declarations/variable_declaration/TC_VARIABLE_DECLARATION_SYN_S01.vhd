-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Production-specific: exercises variable_declaration with record-typed variable in a decode process, demonstrating all tokens of the BNF rule.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity variable_decl_syn_s1 is
  port (
    opcode : in  bit_vector(2 downto 0);
    flags  : out bit_vector(3 downto 0)
  );
end entity variable_decl_syn_s1;

architecture rtl of variable_decl_syn_s1 is
  type t_decode_result is record
    alu_op  : bit_vector(1 downto 0);
    use_carry : bit;
    update_flags : bit;
  end record;
begin
  process(opcode)
    variable v_decode : t_decode_result := ("00", '0', '0');
  begin
    case opcode is
      when "000" => v_decode := ("00", '0', '1');
      when "001" => v_decode := ("01", '1', '1');
      when "010" => v_decode := ("10", '0', '0');
      when others => v_decode := ("11", '0', '0');
    end case;
    flags(1 downto 0) <= v_decode.alu_op;
    flags(2) <= v_decode.use_carry;
    flags(3) <= v_decode.update_flags;
  end process;
end architecture rtl;
