-- =============================================================
-- Case ID: TC_MODE_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Semantic distinction: buffer-mode port read back in a feedback loop demonstrates the key difference between buffer (readable internally) and out (not readable).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mode_sem_buffer_fb is
  port (
    clk       : in  bit;
    count_val : buffer integer range 0 to 15
  );
end entity mode_sem_buffer_fb;

architecture rtl of mode_sem_buffer_fb is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if count_val = 15 then
        count_val <= 0;
      else
        count_val <= count_val + 1;
      end if;
    end if;
  end process;
end architecture rtl;
