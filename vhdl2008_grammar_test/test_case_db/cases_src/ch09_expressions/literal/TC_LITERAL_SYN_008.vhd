-- =============================================================
-- Case ID: TC_LITERAL_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: all five kinds of literal appear together in one design: numeric_literal(integer), enumeration_literal(character), string_literal, bit_string_literal, null, verifying that the compiler correctly distinguishes all literal types in the same context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_all_five is
  port (
    mode_sel : in  integer range 0 to 4;
    data_out : out string(1 to 4)
  );
end entity lit_all_five;

architecture all_forms of lit_all_five is
  constant C_NUM   : integer := 42;           -- numeric_literal
  constant C_ENUM  : character := 'X';        -- enumeration_literal
  constant C_STR   : string(1 to 4) := "OKAY"; -- string_literal
  constant C_BITS  : bit_vector(7 downto 0) := X"FF"; -- bit_string_literal
  type t_ptr is access integer;
begin
  with mode_sel select
    data_out <= integer'image(C_NUM)   when 0,
                (1 => C_ENUM, others => ' ') when 1,
                C_STR                  when 2,
                "NULL" when 3,
                "DONE" when 4;
  process
    variable v_null_check : t_ptr := null;      -- null literal
  begin
    wait;
  end process;
end architecture all_forms;
