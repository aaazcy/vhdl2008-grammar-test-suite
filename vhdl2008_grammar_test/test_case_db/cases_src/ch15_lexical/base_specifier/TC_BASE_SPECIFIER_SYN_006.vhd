-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Positive
-- Test Focus: All 10 kinds of base_specifier( B O X UB UO UX SB SO SX D ) appearing together in a single architecture: verify the 10 specifiers are mutually independent and all legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsp_all_ten_specifiers is
  port (
    r : out integer
  );
end entity bsp_all_ten_specifiers;

architecture rtl of bsp_all_ten_specifiers is
  constant C_B  : bit_vector(3 downto 0) := B"1010";
  constant C_O  : bit_vector(5 downto 0) := O"37";
  constant C_X  : bit_vector(7 downto 0) := X"AB";
  constant C_UB : bit_vector(3 downto 0) := UB"0101";
  constant C_UO : bit_vector(5 downto 0) := UO"26";
  constant C_UX : bit_vector(7 downto 0) := UX"CD";
  constant C_SB : bit_vector(3 downto 0) := SB"1100";
  constant C_SO : bit_vector(5 downto 0) := SO"15";
  constant C_SX : bit_vector(7 downto 0) := SX"EF";
  constant C_D  : bit_vector(7 downto 0) := D"128";
begin
  r <= 42;
end architecture rtl;
