-- =============================================================
-- Case ID: TC_GENERIC_LIST_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Test Focus: SNN — trailing delimiter/semicolon after the last generic
--   interface declaration in the list. While some languages allow trailing
--   separators, VHDL's generic_interface_list does not permit an extra ';'
--   after the final element. This violates the list structure:
--   element { ; element } — the final element must not be followed by ';'.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (trailing semicolon after last element)
-- Dependencies: None
-- =============================================================

-- ERROR: trailing semicolon after the last generic declaration NUM_BITS.
-- The interface_list syntax is: element { ; element }
-- An extra ';' after the last element is syntactically invalid in VHDL.
entity priority_encoder is
  generic (
    INPUT_COUNT : integer := 4;
    NUM_BITS    : integer := 2;
  );
  port (
    din  : in  bit_vector(INPUT_COUNT-1 downto 0);
    dout : out bit_vector(NUM_BITS-1 downto 0);
    valid : out bit
  );
end entity priority_encoder;

architecture rtl of priority_encoder is
begin
  process(din)
  begin
    valid <= '0';
    dout  <= (others => '0');
    for i in INPUT_COUNT-1 downto 0 loop
      if din(i) = '1' then
        dout  <= (others => '0');
        valid <= '1';
        exit;
      end if;
    end loop;
  end process;
end architecture rtl;
