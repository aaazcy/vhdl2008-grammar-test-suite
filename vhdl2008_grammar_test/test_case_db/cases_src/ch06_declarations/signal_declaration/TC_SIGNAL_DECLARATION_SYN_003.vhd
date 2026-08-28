-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises signal_declaration with enumeration-typed and record-typed signals for a data processing pipeline.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_decl_syn3 is
  port (
    clk    : in  bit;
    start  : in  bit;
    done   : out bit
  );
end entity signal_decl_syn3;

architecture rtl of signal_decl_syn3 is
  type t_fsm_state is (S_IDLE, S_FETCH, S_DECODE, S_EXECUTE, S_WRITEBACK);
  type t_alu_op is record
    opcode : bit_vector(2 downto 0);
    src_a  : bit_vector(7 downto 0);
    src_b  : bit_vector(7 downto 0);
  end record;
  signal s_state : t_fsm_state := S_IDLE;
  signal s_alu_op : t_alu_op := (opcode => "000", src_a => (others => '0'), src_b => (others => '0'));
  signal s_cycle_count : integer range 0 to 10 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      case s_state is
        when S_IDLE =>
          if start = '1' then s_state <= S_FETCH; end if;
        when S_FETCH =>
          s_state <= S_DECODE;
        when S_DECODE =>
          s_state <= S_EXECUTE;
        when S_EXECUTE =>
          s_state <= S_WRITEBACK;
        when S_WRITEBACK =>
          s_state <= S_IDLE;
          done <= '1';
      end case;
    end if;
  end process;
end architecture rtl;
