-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SYN_001
-- Rule Type: Syntax
-- BNF Production: GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Test Focus: generic_clause on an entity declaration with a single integer
--   generic. Verifies the full syntax: keyword "generic", opening '(',
--   the generic_list (single generic_interface_declaration), closing ')',
--   and terminating ';'. All five tokens of the production are exercised.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity counter_modulo is
  generic (
    MODULUS : integer := 10
  );
  port (
    clk    : in  bit;
    rst_n  : in  bit;
    count  : out integer range 0 to MODULUS-1;
    ovf    : out bit
  );
end entity counter_modulo;

architecture rtl of counter_modulo is
  signal s_count : integer range 0 to MODULUS-1 := 0;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_count <= 0;
    elsif clk'event and clk = '1' then
      if s_count = MODULUS-1 then
        s_count <= 0;
      else
        s_count <= s_count + 1;
      end if;
    end if;
  end process;

  count <= s_count;
  ovf   <= '1' when s_count = MODULUS-1 else '0';
end architecture rtl;
