-- =============================================================
-- Case ID: TC_LITERAL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: all five literal forms (numeric, enumeration, string, bit_string, null) in a single architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn7_ent is port(y_int:out integer; y_bit:out bit; y_str:out string(1 to 3); y_bv:out bit_vector(3 downto 0)); end entity;
architecture bh of literal_syn7_ent is
  type t_ptr is access integer;
begin
  process is
    variable v_ptr:t_ptr:=null;
  begin
    y_int <= 255;                    -- numeric_literal
    y_bit <= '1';                    -- enumeration_literal
    y_str <= "ABC";                  -- string_literal
    y_bv  <= X"F";                   -- bit_string_literal
    v_ptr := null;                   -- null literal
    wait;
  end process;
end architecture bh;
