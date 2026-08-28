-- =============================================================
-- Case ID: TC_FULL_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FULL_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: full_type_declaration ::= type identifier is type_definition ;
-- Case Type: Positive
-- Test Focus: Exercises full_type_declaration with an integer type, enumeration type, and array type all in one architecture.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity full_type_decl_syn1 is
  port (
    op : in integer range 0 to 3;
    a  : in bit_vector(3 downto 0);
    b  : in bit_vector(3 downto 0);
    y  : out bit_vector(3 downto 0)
  );
end entity full_type_decl_syn1;

architecture rtl of full_type_decl_syn1 is
  type t_alu_op is (T_ADD, T_SUB, T_AND, T_OR);
  type t_byte_array is array(0 to 3) of bit_vector(3 downto 0);
  signal s_ops : t_byte_array := (others => (others => '0'));
begin
  process(a, b, op)
    variable v_op : t_alu_op;
  begin
    case op is
      when 0 => v_op := T_ADD;
      when 1 => v_op := T_SUB;
      when 2 => v_op := T_AND;
      when 3 => v_op := T_OR;
    end case;
    case v_op is
      when T_ADD => y <= a xor b;
      when T_SUB => y <= a xor b xor "0001";
      when T_AND => y <= a and b;
      when T_OR  => y <= a or b;
    end case;
  end process;
end architecture rtl;
