-- =============================================================
-- Case ID: TC_LITERAL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Rule Description: The type of a literal must be compatible with the type of the usage context; numeric_literal is compatible with integer/real/physical, enumeration_literal must belong to the target enumeration type, and string_literal length must match the target
-- Test Focus: all five kinds of literal used correctly in their own compatible contexts: integer literal assigned to integer, character literal assigned to character, string literal assigned to a string of matching length, bit_string assigned to bit_vector, null assigned to access
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_sem_001 is
  port (
    sel   : in  integer range 0 to 4;
    o_int : out integer;
    o_ch  : out character;
    o_str : out string(1 to 3);
    o_bv  : out bit_vector(3 downto 0);
    o_ok  : out bit
  );
end entity lit_sem_001;

architecture type_compatible of lit_sem_001 is
  type t_ptr is access integer;
begin
  process(sel)
    variable v_ptr : t_ptr := null;
  begin
    case sel is
      when 0 => o_int <= 100;          -- numeric_literal -> integer
      when 1 => o_ch  <= 'Z';          -- enumeration_literal -> character
      when 2 => o_str <= "ABC";        -- string_literal -> string(1 to 3)
      when 3 => o_bv  <= X"F";         -- bit_string_literal -> bit_vector
      when 4 => o_ok  <= '1';          -- null not used here, but declared above
    end case;
  end process;
end architecture type_compatible;
