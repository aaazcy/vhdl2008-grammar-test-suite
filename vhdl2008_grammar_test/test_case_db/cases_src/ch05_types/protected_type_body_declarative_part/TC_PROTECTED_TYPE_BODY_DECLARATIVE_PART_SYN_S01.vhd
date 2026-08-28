-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: body declarative part with
--   all major item categories — type, subtype, constant,
--   variable, alias, attribute_specification — all before
--   subprogram bodies. Exercises the full repetition grammar.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_syn_s01 is
  port (
    wr     : in  bit;
    rd     : out bit_vector(7 downto 0)
  );
end entity pt_body_dp_syn_s01;

architecture rtl of pt_body_dp_syn_s01 is
  subtype t_mbox_word is bit_vector(7 downto 0);
  type t_mbox is protected
    procedure post(msg : bit_vector(7 downto 0));
    impure function peek return t_mbox_word;
  end protected;
  type t_mbox is protected body
    constant C_EMPTY : bit_vector(7 downto 0) := (others => '0');
    subtype t_msg is bit_vector(7 downto 0);
    type t_flags is (EMPTY, FULL);
    variable v_msg  : t_msg := C_EMPTY;
    variable v_flag : t_flags := EMPTY;
    alias a_hi : bit is v_msg(7);
    procedure post(msg : bit_vector(7 downto 0)) is
    begin
      v_msg := msg; v_flag := FULL;
    end procedure;
    impure function peek return t_mbox_word is
    begin
      return v_msg;
    end function;
  end protected body;
  shared variable sv : t_mbox;
begin
  process(wr)
  begin
    if wr'event and wr = '1' then
      sv.post("10101010");
      rd <= sv.peek;
    end if;
  end process;
end architecture rtl;
