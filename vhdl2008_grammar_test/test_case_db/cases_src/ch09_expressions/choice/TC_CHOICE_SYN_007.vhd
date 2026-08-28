-- =============================================================
-- Case ID: TC_CHOICE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: others choice combined with explicit choices: the first three choices in the case statement are simple_expressions, and others catches all remaining values, used for communication protocol frame type decoding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_others is
  port (
    frame_type : in  integer range 0 to 255;
    payload    : out integer
  );
end entity ch_others;

architecture frame_decode of ch_others is
  constant C_SYNC   : integer := 0;
  constant C_ACK    : integer := 1;
  constant C_NACK   : integer := 2;
begin
  process(frame_type)
  begin
    case frame_type is
      when 0 =>             -- simple_expression: sync
        payload <= C_SYNC;
      when 1 =>             -- simple_expression: ack
        payload <= C_ACK;
      when 2 =>             -- simple_expression: nack
        payload <= C_NACK;
      when others =>        -- others choice: all data frames
        payload <= frame_type;
    end case;
  end process;
end architecture frame_decode;
