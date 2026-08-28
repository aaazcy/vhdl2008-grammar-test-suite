-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Positive
-- Test Focus: extended_identifier containing special characters (dot, minus, digits), verifying the wide acceptance range of graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_id_special is
  port (
    \clk.in\  : in  bit;
    \rst-n\   : in  bit;
    \q_out\   : out bit
  );
end entity ext_id_special;

architecture rtl of ext_id_special is
  signal \dff.q\ : bit := '0';
begin
  process(\clk.in\, \rst-n\)
  begin
    if \rst-n\ = '1' then
      \dff.q\ <= '0';
    elsif \clk.in\'event and \clk.in\ = '1' then
      \dff.q\ <= '1';
    end if;
  end process;
  \q_out\ <= \dff.q\;
end architecture rtl;
