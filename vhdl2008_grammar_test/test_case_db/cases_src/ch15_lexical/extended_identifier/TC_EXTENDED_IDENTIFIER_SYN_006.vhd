-- =============================================================
-- Case ID: TC_EXTENDED_IDENTIFIER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: extended_identifier ::= \ graphic_character { graphic_character } \
-- Case Type: Positive
-- Test Focus: extended_identifier and basic_identifier mixed in ports and signals, verifying interoperability of both identifier kinds in the same entity
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity ext_id_mixed is
  port (
    clk      : in  bit;
    \enable\ : in  bit;
    \d.out\  : out bit;
    q_n      : out bit
  );
end entity ext_id_mixed;

architecture rtl of ext_id_mixed is
  signal \internal_reg\ : bit := '0';
  signal reg_val        : bit := '1';
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if \enable\ = '1' then
        \internal_reg\ <= reg_val;
      end if;
    end if;
  end process;
  \d.out\ <= \internal_reg\;
  q_n     <= not \internal_reg\;
end architecture rtl;
