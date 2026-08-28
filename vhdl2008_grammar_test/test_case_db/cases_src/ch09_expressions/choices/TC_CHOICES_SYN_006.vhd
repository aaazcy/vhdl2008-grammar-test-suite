-- =============================================================
-- Case ID: TC_CHOICES_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: Multiple choices (5+) combined with pipes: 5 simple_expressions joined by pipes, used for batch matching of DMA channel numbers
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity chs_many_pipe is
  port (
    ch_id  : in  integer range 0 to 15;
    active : out bit
  );
end entity chs_many_pipe;

architecture dma_sel of chs_many_pipe is
begin
  process(ch_id)
  begin
    case ch_id is
      when 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 =>   -- 8 choices with pipes
        active <= '1';
      when others =>
        active <= '0';
    end case;
  end process;
end architecture dma_sel;
