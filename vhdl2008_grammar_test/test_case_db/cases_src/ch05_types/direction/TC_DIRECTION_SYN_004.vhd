-- =============================================================
-- Case ID: TC_DIRECTION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: "downto" direction in FOR GENERATE for priority encoder.
--   Uses descending index to assign priority from MSB (7) downto LSB
--   (0). The conditional generate exercises downto-specific iteration.
-- Expected Result: Compiles; highest set bit index output
-- Dependencies: None
-- =============================================================
entity priority_encoder is
  port (
    request   : in  bit_vector(7 downto 0);
    grant_idx : out integer range 0 to 7
  );
end entity priority_encoder;

architecture downto_generate of priority_encoder is
  signal found : bit_vector(7 downto 0) := (others => '0');
begin
  gen_priority: for i in 7 downto 0 generate
    found(i) <= '1' when request(i) = '1' and found(i + 1) = '0' else '0';
  end generate;
  process(found)
  begin
    grant_idx <= 0;
    for i in 7 downto 0 loop
      if found(i) = '1' then
        grant_idx <= i;
      end if;
    end loop;
  end process;
end architecture downto_generate;
