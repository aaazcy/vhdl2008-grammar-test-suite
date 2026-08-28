-- =============================================================
-- Case ID: TC_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: string_literal as a literal: the strings "idle", "read", "write" in VHDL as string_literal assigned to a string type signal, used for UART command word comparison
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_string_literal is
  port (
    cmd_sel : in  integer range 0 to 2;
    matched : out bit
  );
end entity lit_string_literal;

architecture cmd_decode of lit_string_literal is
  signal s_cmd : string(1 to 4);
begin
  with cmd_sel select
    s_cmd <= "idle" when 0,   -- string_literal
             "read" when 1,   -- string_literal
             "writ" when 2;  -- string_literal

  matched <= '1' when s_cmd = "read" else '0';
end architecture cmd_decode;
